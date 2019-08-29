
import numpy as np
import cvxpy as cvx




def optimal_power(n, a_val, b_val, P_tot=1.0, W_tot=1.0):

  # Input parameters: alpha and beta are constants from R_i equation
  n=len(a_val)
  if n!=len(b_val):
    print('alpha and beta vectors must have same length!')
    return 'failed',np.nan,np.nan,np.nan
  P=cvx.Variable(n)
  W=cvx.Variable(n)
  alpha=cvx.Parameter(n)
  beta =cvx.Parameter(n)
  alpha.value=np.array(a_val)
  beta.value =np.array(b_val)
  # This function will be used as the objective so must be Disciplined Convex Programming;
  R=cvx.kl_div(cvx.multiply(alpha, W),
               cvx.multiply(alpha, W + cvx.multiply(beta, P))) - \
    cvx.multiply(alpha, cvx.multiply(beta, P))
  objective=cvx.Minimize(cvx.sum(R))
  constraints=[P>=0.0,
               W>=0.0,
               cvx.sum(P)-P_tot==0.0,
               cvx.sum(W)-W_tot==0.0]
  prob=cvx.Problem(objective, constraints)
  prob.solve()
  return prob.status,-prob.value,P.value,W.value


if __name__ == '__main__':
  # Определим количество знаков после запятой
  np.set_printoptions(precision=3)
  n=8               # количество приемников в системе
  a_val= [1 ,5, 1,1 , 6, 1 , 6]  # alpha
  b_val=[1.0]*n  #  beta
  b_val= [1 ,1 ,1 ,1 ,1, 1 , 1]  # beta
  P_tot=0.5
  W_tot=1.0
  print('Test problem data:')
  print('n = %d Ptot = %.3f Wtot = %.3f'%(n,P_tot,W_tot,))
  print('alpha =',a_val)
  print('betta =',b_val)
  status,utility,power,bandwidth=optimal_power(n,a_val,b_val,P_tot,W_tot)
  print('Status =',status)
  print('Optimal utility value = %.4g '%utility) #полезность
  print('Optimal power level:\n', power) # мощность
  print('Optimal bandwidth:\n', bandwidth) #пропускная способность

