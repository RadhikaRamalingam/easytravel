#Create a directory for storing snapshot
dir_path = "/home/vchouhan/vijay_work/snapshot"
unless Dir.exist?(dir_path)
    Dir.mkdir(dir_path,0777)
    puts "=========Directory is created at #{dir_path}"
else
    puts "=========Directory is exist at #{dir_path}"
end

#Run after each scenario
After do |scenario|
  #Check, scenario is failed?
  if(scenario.failed?)
         time = Time.now.strftime('%Y_%m_%d_%Y_%H_%M_%S_')
         name_of_scenario = time + scenario.name.gsub(/\s+/, "_").gsub("/","_")
         puts "Name of snapshot is #{name_of_scenario}"
         file_path = File.expand_path(dir_path)+'/'+name_of_scenario +'.png'
         page.driver.browser.save_screenshot file_path
         puts "Snapshot is taken"
    puts "#===========================================================#"
    puts "Scenario:: #{scenario.name}"
    puts "#===========================================================#"
  end
end