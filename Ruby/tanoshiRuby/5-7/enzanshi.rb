arr1 = ["banana", "grape", "melon"]
arr2 = ["apple", "google", "amazon"]

p arr1 + arr2 #=>["banana", "grape", "melon", "apple", "google", "amazon"]
p arr1 << arr2 #=>["banana", "grape", "melon", ["apple", "google", "amazon"]]
p arr1 #=>["banana", "grape", "melon", ["apple", "google", "amazon"]]
p arr2 #=>["apple", "google", "amazon"]