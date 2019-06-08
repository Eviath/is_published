module IsPublished
 module Scopes
   def published
     where(published: true)
   end
 end
end