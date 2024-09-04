#import "../typst_packages\lecture.typ" : *
 

#show : doc => conf(
  title :"Introduction to Analysis",
  author : "Po-Hsuan Chen",
  subtitle : "Lecture Notes",
  doc
)

#makeTitle
#outline()


#heading-without-number([Notation])
- $NN = {0,1,2, dots}$
- $ZZ^+ = {1,2,3, dots}$

= Introduction to Analysis
#discussion[
  Take $x in RR$ which satisfies $x >= 0$. Let $a_0 = [x]$. Since $x >=0$, we know $a_o in NN$. 
  By definition, we have $a_0  <= x < a_0 +1$ or equivalency
  #numeq($0 <= 10(x - a_0) < 1  0$)
  Next take $a_1 = [10x-a_0]$. @1.1 implies $0 <=a_1<=9$. By definition, we have 
  $
    a_1 <= 10(x-a_0) < a_1 +1
  $
  ,or equivalency
  $
    a_0 + a_1/10 <= x < a_0 + a_1/10 + 1/10
  $
  Inductively, we suppose that we havve already found a finite list
  $
    a_0 in NN, space.quad a_1, dots, a_n in {0,1,2, dots, 9}
  $
  such that for $1 <=k<=n$ we have
  #numeq($
    sum_(alpha = 0)^k a_alpha / 10^alpha <= x < sum_(alpha = 0)^k a_alpha / 10^alpha + 1/10^k
  $)
  @1.2 implies 
  $
    sum_(alpha = 0)^n 10^(n+1-alpha) a_alpha <= 10^(n+1)x < sum_(alpha = 0)^n 10^(n+1-alpha) a_alpha + 10 $
  #numeq($
   implies 0 <= 10^(n+1)(x - sum_(alpha = 0)^n 10^(n+1-alpha) a_alpha) < 1   
  $)
  Take $a_(n+1) = [10 ^(n+1)x - sum_(alpha = 0)^n 10 ^(n+1-alpha) a_alpha]$. 
  @1.3 implies $a_(n+1) in {0,1,dots,9}$. By definition, $a_(n+1) <= 10^(n+1-alpha) - sum_(alpha = 0)^n 10^(n+1-alpha) a_alpha < a_(n+1)+1$
  which is equivalent to
  $
    sum_(alpha = 0)^(n+1) a_alpha / 10^(alpha) <= x < sum_(alpha = 0)^(n+1) a_alpha / 10^(alpha) + 1/10^(n+1)
  $
]<discussioss1.1>
@discussioss1.1 leads to the following lemma
#lemma[
  Let $x in RR$ with $x >= 0$. Then it follow s that we have a unique squence ${a_n}_(n=0)^infinity$,
  $( a_i in NN, space forall i)$ such that $a_k in {0,1,dots,9}$ for all $k >= 1$ and  that
  #numeq($
    sum_(alpha = 0)^n a_alpha / 10^alpha <= x < sum_(alpha = 0)^n a_alpha / 10^alpha + 1/10^n
  $)
  holds for all $n >= 0$.
]<lemma1.1>
#remark[
  @lemma1.1 implies that 
  $
   lim_(n -> infinity) sum_(alpha = 0)^n a_alpha / 10^alpha = x
  $
]
@lemma1.1 leads to 
#corollary[
  $QQ$ is dense in $RR$.
]<collary1.1>
We cast this rsult in a boarder framewark.

#definition[
  Let $X$ be non-empty set. A *metric* on $X$ is a function $d: X times X -> coinv(0,infinity)$ such that
  + $d(x,y) = 0$ if and only if $x = y$,
  + $d(x,y) = d(y,x)$ for all $x,y in X$,
  + $d(x,z) <= d(x,y) + d(y,z)$ for all $x,y,z in X$.
  We say that $(X,d)$ is a *metric space*.
]

#definition[
  Let $(X,d)$ be a metric space. Take $E$ be a subset of $X$, We say that $E$ is *dense* in $X$ if 
  for each $x in X$ and any $epsilon > 0$, we can find some $a in E$ such that $0<=d(x,a)< epsilon$.
]

#discussion[
  Take $x in RR$, $N in ZZ^+$. Consider the list $k x-[k x]$, where $k=0,1,2,dots,N$.
  Observe #numeq($k x-[k x] in coinv(0,1) "for" k = 0,1,2,dots,N$)
  But
  #numeq($
    coinv(0,1) = union.big^(N-1)_(alpha = 0) coinv(alpha/N,(alpha+1)/N) = coinv(0,1/N) union coinv(1/N,2/N) union dots union coinv((N-1)/N,1)
  $)
  By Pigeonhole principle, we define from @1.5 to @1.6 that there exists integers $0<=k_1 <k_2<=N$, together with some integer $0<=alpha<= N-1$ such that
  #numeq($
    cases(
      k_1x - [k_1x] in coinv(alpha/N,(alpha+1)/N)\
      k_2x - [k_2x] in coinv(alpha/N,(alpha+1)/N)
    )
  $)
  @1.7 implies 
  $
    abs((k_2-k_1)x - ([k_2x]-[k_1x])) < 1/N
  $
  By construction, we know $1<=k_2 -k_1 <= N$, and $[k_2x] - [k_1x] in ZZ$.
]<discussioss1.2>
@discussioss1.2 leads to the following result
#lemma[
  Let $x in RR$, $N in ZZ^+$. we can find some $k in {1,2,dots,N}$ and some $l in ZZ$ such that 
  $abs(k x-l) < 1/N$ or 
  $
    abs(x-l/k) < 1/(N k) <= 1/k^2
  $
]<lemma1.2>

Base on @lemma1.2, we now prove
#lemma[
  Let $x  in RR\\QQ$, the following set is not finite.
  $
    E = {l/k : l in ZZ, k in ZZ^+, "and" abs(x-l/k) < 1/k^2}
  $
]
#proof[
  Assume towards contradiction that $E$ is finite. So, that $E = {1_1/k_1,1_2/k_2,dots,1_m/k_m }$
  such that for any $1<= alpha <= m$ we have 
  #numeq($
    l_alpha in ZZ,space  k_alpha >= 1 "and" 0<abs(x - l_alpha/k_alpha) < 1/k^2
  $)
  Take 
  #numeq($
    cases(delta = min{abs(x - l_alpha/k_alpha): 1<= alpha <=m} > 0\ 
          N = [1/delta]+1  > 1/delta)
  $)
  However, in accordance to @lemma1.2, there exists $1<= tilde(k) <= N$, $tilde(l) in ZZ$ 
  sucht that $abs(tilde(k)x - tilde(l)) < 1/N$ or
  #numeq($
    abs(x - tilde(l)/tilde(k)) < 1/(N tilde(k))
  $)
  @1.10 implies
  #numeq($
    abs(x-tilde(l)/tilde(k)) < 1/(N tilde(k)) <= 1/ tilde(k)^2
  $)
  @1.10 and @1.9 implies for all $1<= alpha <= m$
  #numeq($
    abs(x - tilde(l)/tilde(k)) < 1/(N tilde(k)) <= 1/N < delta <= abs(x - l_alpha/k_alpha)
  $)
  @1.12 leads 
  $ tilde(l)/tilde(k) in.not E $
  A controdiction has been arrived.
  

]