require 'i_can_has_java_class'

module Kernel
  def java_class_defined?(class_string)
    ::ICanHasJavaClass.java_class_defined?(class_string)
  end

  def java_class_for(class_string)
    ::ICanHasJavaClass.java_class_for(class_string)
  end
end
