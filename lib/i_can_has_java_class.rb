require 'java'
require "i_can_has_java_class/version"

module ICanHasJavaClass
  def self.java_class_defined?(class_string)
    !!java_class_exists_in_class_loader?(class_string, ::JRuby.runtime.jruby_class_loader) ||
      !!java_class_exists_in_class_loader?(class_string, nil)
  end

  def self.java_class_exists_in_class_loader?(class_string, class_loader)
    if class_loader
      return ::Java::JavaLang::Class.forName(class_string, false, class_loader)
    else
      return ::Java::JavaLang::Class.forName(class_string)
    end
  rescue ::Java::JavaLang::ClassNotFoundException
    return false
  end

  def self.java_class_for(class_string)
    case
    when (klass = java_class_exists_in_class_loader?(class_string, ::JRuby.runtime.jruby_class_loader)) then
      return klass
    when (klass = java_class_exists_in_class_loader?(class_string, nil)) then
      return klass
    else
      raise ::Java::JavaLang::ClassNotFoundException.new
    end
  end
end
