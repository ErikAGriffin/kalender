module Hobbit
  module Hole

    # overwrite any methods from the hobbit-hole module here.

    # I feel like some of these methods could somehow be implemented
    # into the class models.

    def register_new_user_pair(new_user_pair)
      family = new_user_pair[:family]
      patient = register_new_patient(new_user_pair[:patient])
      if patient
        register_new_family_member(patient, family)
      end
    end

    def register_new_patient(patient)
      new_user =  create_user(patient[:email].downcase,patient[:password],0)
      if new_user
        create_patient(new_user.id,patient[:firstName],patient[:lastName])
      end
    end

    def register_new_family_member(patient, family)
      new_user = create_user(family[:email].downcase,family[:password],1)
      if new_user
        create_family_member(new_user.id,family[:firstName],family[:lastName],patient.id)
      end
    end

    def create_family_member(id,first_name,last_name,patient_id)
      new_family_member = FamilyMember.new(first_name:first_name,last_name:last_name,patient_id:patient_id){|f|f.id = id}
      new_family_member.valid? ? new_family_member.save : false
    end

    def create_patient(id,first_name,last_name)
      new_patient = Patient.new(first_name:first_name,last_name:last_name){|p| p.id = id}
      new_patient.valid? ? new_patient.save : false
    end

    def create_user(email,password,role)
      new_user = User.new(email:email,password:password,role:role)
      new_user.valid? ? new_user.save : false
    end

  end
end
