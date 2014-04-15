require 'spec_helper'

describe ::ICanHasJavaClass do
  context "#java_class_defined?" do
    it "is true when class is defined" do 
      described_class.java_class_defined?("java.lang.Class").should be_true
    end

    it "is false when class is not defined" do
      described_class.java_class_defined?("java.lang.some.other.potential.class.that.may.be.used").should be_false
    end
  end

  context "#java_class_for" do
    it "returns a known classs java_class" do
      described_class.java_class_for("java.lang.Class").should eq(::Java::JavaLang::Class.java_class)
    end

    it "raises an exception on no class found" do 
      expect {
        described_class.java_class_for("java.lang.some.other-potential.class.that.may.be.user")
      }.to raise_error(::Java::JavaLang::ClassNotFoundException)
    end
  end
end
