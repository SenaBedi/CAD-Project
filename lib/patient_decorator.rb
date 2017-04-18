# the concrete component we would like to decorate, a car in our example

class Patient

    def initialize(firstname, lastname, dob, address, phone, infection)


        @firstname = firstname

        @lastname = lastname

        @dob = dob

        @address = address
        @phone = phone
        @infection = infection

    end

    

    # getter method

    def firstname 

        return @firstname

    end

    
# getter method

    def lastname 

        return @lastname

    end


# getter method

    def dob 

        return @dob

    end
# getter method

    def address 

        return @address

    end

# getter method

    def phone 

        return @phone

    end

# getter method

    def infection 

        return @infection

    end 

 
# a method which returns a string representation of the object of type patient

    def details

      return @description + "; " + @firstname + "; " + @lastname + ": " + @dob + ": "+ @address + ": "+ @phone + ": " + "#{@infection}"

    end

    

end # ends the patient class

# decorator class -- this serves as the superclass for all the concrete decorators

# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration

class PatientDecorator < Patient

    def initialize(patient)

        #the component we want to decorate

        @patient = patient

        super(@patient.firstname, @patient.lastname, @patient.dob, @patient.address, @patient.phone, @patient.infection)

        @extra_infection = " "

        

    end    

    # override the infection method to include the infection of the extra feature	

    def infection       

        return @extra_infection + @patient.infection

    end

    

    # override the details method to include the description of the extra feature

   def details

       return  @description + ": " + "#{@infection}" + ". " + @patient.details

    end

    

end # ends the patientDecorator class


# a concrete decorator --  define an extra feature

class BodyDecorator < PatientDecorator

    def initialize(patient)

        super(patient)

        @extra_infection = "fever"

        @description = "This patient has also body fever"

    end

end # ends the BodyDecorator class

class AbdominalDecorator < PatientDecorator

    def initialize(patient)

        super(patient)

        @extra_infection = "cramp"

        @description = "This patient has also abdominal pain"

    end
end #end AbdominalDecorator
 
# another concrete decorator -- define an extra feature

class HeadDecorator < PatientDecorator

    def initialize(patient)

        super(patient)

        @extra_infection = "headache"

        @description = "This patient has also headache"

    end

 end # end HeadDecorator class
  
