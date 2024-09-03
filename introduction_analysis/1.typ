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
  #numbered_eq($0 <= 10(x - a_0) < 1  0$)<1.1>
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
  #numbered_eq($
    sum_(alpha = 0)^k a_alpha / 10^alpha <= x < sum_(alpha = 0)^k a_alpha / 10^alpha + 1/10^k
  $)<1.2>
  @1.2 implies 
  $
    sum_(alpha = 0)^n 10^(n+1-alpha) a_alpha <= 10^(n+1)x < sum_(alpha = 0)^n 10^(n+1-alpha) a_alpha + 10 $
  #numbered_eq($
   imples 0 <= 10^(n+1)(x - sum_(alpha = 0)^n 10^(n+1-alpha) a_alpha) < 1   
  $)<1.3>
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
  $
    sum_(alpha = 0)^n a_alpha / 10^alpha <= x < sum_(alpha = 0)^n a_alpha / 10^alpha + 1/10^n
  $
  holds for all $n >= 0$.
]<lemma1.1>
#remark[
  @lemma1.1 imples that 
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
  Let $X$ be non-empty set. A *metric* on $X$ is a function $d: X times X -> [0,infinity)$ such that
  + $d(x,y) = 0$ if and only if $x = y$,
  + $d(x,y) = d(y,x)$ for all $x,y in X$,
  + $d(x,z) <= d(x,y) + d(y,z)$ for all $x,y,z in X$.
  We say that $(X,d)$ is a *metric space*.
]

= test 
#lorem(39)