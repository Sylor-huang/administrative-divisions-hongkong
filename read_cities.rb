cities = File.read("./hongkong.json")
save_cities = "./honkong_json.json"
all_cities = []
eval(cities).each_with_index do |item, index|
  puts "first loop index: #{index}"
  puts "item: #{item[0]}"
  first_name = item[0].to_s
  if first_name.include?("香港")
    first_label = "hk" + "#{index+1}00"
  elsif first_name.include?("澳门")
    first_label = "mo"+ "#{index}00"
  else
    first_label = "tw"+ "#{index}00"
  end
  children = []
 item[1].each_with_index do |k, sub_index|
  puts "second loop index: #{sub_index}"
  children.push({value: "#{first_label}#{sub_index +1}", label: k[0].to_s})
 end
 all_cities.push({
  value: first_label,
  label: first_name,
  children: children
 })

end

puts "each end"

File.open(save_cities, "wb") do |f|
            f.write(all_cities)
            f.close
          end
