require_relative '../../entities/gathering'

def valid_gathering
    gathering = Gathering.new("Monica and Jeremy's Summer Nuptuals", "Monica and Jeremy will symbolically join their lives in the summer of 2013.", "Wedding")
end

describe Gathering do
    it "is valid with valid attributes" do
        gathering = valid_gathering
        gathering.should be_valid
    end
    it "is invalid without a name" do
        gathering = valid_gathering
        gathering.name = nil
        gathering.should_not be_valid
    end
    it "is invalid without a description" do
        gathering = valid_gathering
        gathering.description = nil
        gathering.should_not be_valid
    end
    it "returns a type of Other if something is specified other than the built-in types" do
        gathering = valid_gathering
        new_type = "FooBar"
        new_type = new_type + "s" until not Gathering.TYPES.include?(new_type)
        gathering.type = new_type
        gathering.type.should eq("Other")
    end
    it "returns the type description exactly as the type is set regardless of its inclusion in the built-in types'" do
        gathering = valid_gathering
        new_type = "FooBar"
        new_type = new_type + "s" until not Gathering.TYPES.include?(new_type)
        gathering.type = new_type
        gathering.type_description.should eq(new_type)
    end
end
