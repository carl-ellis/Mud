# A mixin which automatically adds methods for serialising via JSON
# usage:
#					attr_serialise :a, :b, ...
#
#	remark: These should have a matching constructor in which to create the object
class Class

	def attr_serialise(*attrs)
    	
		# Sanity checks
		abort "Please provide at least one argument" if attrs.length == 0

		#Build to the to_json method
		tojson = "def to_json(*a)\n{ 'json_class' => #{self.name}"
		attrs.each { |a| tojson << ",\n'#{a}' => @#{a}"}
		tojson << "\n}.to_json(*a)\nend"

		#build to json_create method
		jsoncreate = "def self.json_create(o)\nnew( *o['#{attrs.shift}']"
		attrs.each { |a| jsoncreate << ", *o['#{a}']" }
		jsoncreate << ")\nend"

		# Add methods
		class_eval(tojson)
		class_eval(jsoncreate)
	end
end
