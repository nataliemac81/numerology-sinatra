class Person < ActiveRecord::Base
	def self.determine_birth_path_number(birthdate)
	    m1 = birthdate[0].to_i
	    m2 = birthdate[1].to_i
	    d1 = birthdate[2].to_i
	    d2 = birthdate[3].to_i
	    y1 = birthdate[4].to_i
	    y2 = birthdate[5].to_i
	    y3 = birthdate[6].to_i
	    y4 = birthdate[7].to_i

	    number = m1 + m2 + d1 + d2 + y1 + y2 + y3 + y4

	    num_string = number.to_s

	    first_digit = num_string[0].to_i
	    second_digit = num_string[1].to_i

	    two_number_result = first_digit + second_digit

	    if two_number_result > 9
	        reduced = two_number_result.to_s
	        bpn = reduced[0].to_i + reduced[1].to_i
	    else
	        bpn = two_number_result
	    end

	    return bpn
	end

	def self.determine_message(bpn)
	    case bpn
	    when 1
	        message = "Your numerology number is #{bpn}. \nOne is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
	    when 2
	        message = "Your numerology number is #{bpn}. \nThis is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
	    when 3
	        message = "Your numerology number is #{bpn}. \nNumber Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
	    when 4
	        message = "Your numerology number is #{bpn}. \nThis is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
	    when 5
	        message = "Your numerology number is #{bpn}. \nThis is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
	    when 6
	        message = "Your numerology number is #{bpn}. \nThis is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
	    when 7
	        message = "Your numerology number is #{bpn}. \nThis is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
	    when 8
	        message = "Your numerology number is #{bpn}. \nThis is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
	    when 9
	        message = "Your numerology number is #{bpn}. \nThis is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
	    else
	        message = "That is not a valid number."
	    end
	end

	def self.valid_birthdate(birthdate)
	    if (birthdate.length == 8 && birthdate.match(/^[0-9]+[0-9]$/))
	        return true 
	    else
	        return false
	    end
	end
end
