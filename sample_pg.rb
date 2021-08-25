require 'pg'
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin

    result=connection.exec("select * from crops where give_for !='自家消費';")
    result.each do |record|
        puts "譲渡先 :#{record["give_for"]}"
    end
    


    result_2=connection.exec("select give_for,quality from crops where quality=false;")
result_2.each do |record|
    puts "品質の悪いもの：#{record["give_for"]}　品質：#{record["quality"]}"
end

ensure
    connection.finish
end