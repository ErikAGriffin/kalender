module Hobbit
  module Hole

    # overwrite any methods from the hobbit-hole module here.

    def register_new_patient(patient)
      new_user =  create_user(patient[:email].downcase,patient[:password],0)
      if new_user
        puts "Success!" if create_patient(new_user.id,patient[:firstName],patient[:lastName])
      end

    end

    def create_patient(id,first_name,last_name)
      # To assign a primary_key (which is restricted), you must
      # pass a block with a variable that is the new instance?
      # and assign that field from that variable.
      new_patient = Patient.new(first_name:first_name,last_name:last_name){|p| p.user_id = id}
      new_patient.valid? ? new_patient.save : false
    end

    def create_user(email,password,role)
      new_user = User.new(email:email,password:password,role:role)
      new_user.valid? ? new_user.save : false
    end

  end
end
