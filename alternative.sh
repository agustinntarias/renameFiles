# removes all spaces, makes first instance of an uppercase letter lowercase, removes ) and replaces ( for _
rename 's/\)//' * && rename 's/\(/_/' * && rename 'y/A-Z/a-z/' * && rename 's/\ //g' *

