module Hobbit
  module Hole

    # overwrite any methods from the hobbit-hole module here.

    def register_new_patient(patient)
      p patient
      puts "___" * 10
      new_user =  create_user(patient[:email].downcase,patient[:password],0)
      if new_user
        puts "Success!" if create_patient(new_user.id,patient[:firstName],patient[:lastName])
      end

    end

    def create_patient(id,first_name,last_name)
      puts "Checkpoint B!"
      p id
      p first_name
      p last_name
      new_patient = Patient.new(id:id,first_name:first_name,last_name:last_name)
      new_patient.valid? ? new_patient.save : false
    end

    def create_user(email,password,role)
      puts "Checkpoints A!"
      new_user = User.new(email:email,password:password,role:role)
      new_user.valid? ? new_user.save : false
    end

  end
end
