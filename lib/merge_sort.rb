# frozen_string_literal: false

# divide the list into the smallest unit,
# compare each element with the adjacent list to sort,
# merge the two adjacent lists.
def merge_sort(list)
  return list if list.length < 2

  list_l, list_r = divide_list(list)

  list_l = merge_sort(list_l)
  list_r = merge_sort(list_r)

  merge(list_l, list_r)
end

# halve list
def divide_list(list)
  a = list
  b = list.pop(list.length / 2)
  [a, b]
end

# merge list_l with list_r
def merge(list_l, list_r)
  result = []

  result << (list_l[0] < list_r[0] ? list_l.shift : list_r.shift) while
  list_l.empty? == false && list_r.empty? == false

  merge_remaining_elements(list_l, result)
  merge_remaining_elements(list_r, result)
end

# consume remaining elements
def merge_remaining_elements(list, result)
  result << list.shift while list.empty? == false
  result
end

list = [6, 5, 3, 1, 8, 7, 2, 4]
p merge_sort(list)
