vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

v = {}
vehicles.each do |vehicle|
  if v[vehicle].nil?
    v[vehicle] = 1
  else
    v[vehicle] += 1
  end
end

v