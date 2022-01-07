class CreateMessages < ActiveRecord : : Migration [6.0] 
    def change 
        create_table : messages do |t| 
            t.references : conversation , null : false , foreign_key 
            t.references : user , null : false , foreign_key : true 
            t.text : body 
            t.timestamps 
        end 
    end 
end 

