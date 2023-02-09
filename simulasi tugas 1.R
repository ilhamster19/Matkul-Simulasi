
library(tibble)

# 1 SERVER

# Membuat vektor data
x = c(12,31,63,95,99,154,198,221,304,346,411,455,537)
y = c(40,32,55,48,18,50,47,18,28,54,40,72,12)
n = length(x)

# Membuat wadah vektor T = waktu selesai, t = durasi tunggu
T = rep(0,n)
t = rep(0,n)

# Mengisi vektor T dengan fungsi
for(i in 1:13){
  T[i] = x[1] + sum(y[1:i])
}

# Mengisi vektor t dengan fungsi
for (i in 2:13) {
  if(T[i-1] <= x[i])
    t[i] = 0
  else if (T[i-1] > x[i])
  t[i] = T[i-1] - x[i]
  
  }

# Menampilkan data
data1 = tibble("Customer ke"=c(1:n),
              "Waktu selesai"= T,
              "Durasi tunggu"=t)
View(data1)



# 2 SERVER


# Membuat vektor data
x = c(12,31,63,95,99,154,198,221,304,346,411,455,537)
y = c(40,32,55,48,18,50,47,18,28,54,40,72,12)
n = length(x)


# Membuat wadah vektor T2 = waktu selesai, t2 = durasi tunggu
T2 = rep(0,n)
t2 = rep(0,n)

T2[1] = x[1] + y[1]
T2[2] = x[2] + y[2]

# Mengisi vektor T dengan fungsi
for (i in 3:n) {
  if(T2[i-2] <= T2[i-1]) T2[i] = T2[i-2] + y[i]
  else if(T2[i-2] > T2[i-1]) T2[i] = T2[i-1] + y[i]
}

T2

# Mengisi vektor t dengan fungsi
for (i in 3:n) {
  if(T2[i-2]<=T2[i-1] && T2[i-2]-x[i] > 0) t2[i] = T2[i-2] - x[i]
  else if(T2[i-2]<=T2[i-1] && T2[i-2]-x[i] <= 0) t2[i] = 0
  else if(T2[i-2]>T2[i-1] && T2[i-1]-x[i] > 0)  t2[i] = T2[i-1] - x[i]
  else if(T2[i-2]>T2[i-1] && T2[i-1]-x[i] <= 0) t2[i] = 0
}

t2

# Menampilkan data
data2 = tibble("Customer ke"=c(1:n),
              "Waktu selesai"= T2,
              "Durasi tunggu"=t2)
View(data2)










