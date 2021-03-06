require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

include Rattler::Compiler::ParserGenerator
include Rattler::Parsers

describe LabelGenerator do

  include ParserGeneratorSpecHelper

  let(:label) { Label[:word, Match[/\w+/]] }

  describe '#gen_basic' do

    context 'when nested' do
      it 'generates nested matching code' do
        nested_code {|g| g.gen_basic label }.
          should == '@scanner.scan(/\w+/)'
      end
    end

    context 'when top-level' do
      it 'generates top level matching code' do
        top_level_code {|g| g.gen_basic label }.
          should == '@scanner.scan(/\w+/)'
      end
    end
  end

  describe '#gen_assert' do

    context 'when nested' do
      it 'generates nested positive lookahead code' do
        nested_code {|g| g.gen_assert label }.
          should == '(@scanner.skip(/(?=\w+)/) && true)'
      end
    end

    context 'when top-level' do
      it 'generates top level positive lookahead code' do
        top_level_code {|g| g.gen_assert label }.
          should == '@scanner.skip(/(?=\w+)/) && true'
      end
    end
  end

  describe '#gen_disallow' do

    context 'when nested' do
      it 'generates nested negative lookahead code' do
        nested_code {|g| g.gen_disallow label }.
          should == '(@scanner.skip(/(?!\w+)/) && true)'
      end
    end

    context 'when top-level' do
      it 'generates top level negative lookahead code' do
        top_level_code {|g| g.gen_disallow label }.
          should == '@scanner.skip(/(?!\w+)/) && true'
      end
    end
  end

  describe '#gen_token' do

    context 'when nested' do
      it 'generates nested matching code' do
        nested_code {|g| g.gen_token label }.
          should == '@scanner.scan(/\w+/)'
      end
    end

    context 'when top-level' do
      it 'generates top level matching code' do
        top_level_code {|g| g.gen_token label }.
          should == '@scanner.scan(/\w+/)'
      end
    end
  end

  describe '#gen_skip' do

    context 'when nested' do
      it 'generates nested skipping code' do
        nested_code {|g| g.gen_skip label }.
          should == '(@scanner.skip(/\w+/) && true)'
      end
    end

    context 'when top-level' do
      it 'generates top level skipping code' do
        top_level_code {|g| g.gen_skip label }.
          should == '@scanner.skip(/\w+/) && true'
      end
    end
  end

  describe '#gen_intermediate' do
    it 'generates intermediate matching code' do
      nested_code {|g| g.gen_intermediate label }.
        should == '@scanner.scan(/\w+/)'
    end
  end

  describe '#gen_intermediate_assert' do
    it 'generates intermediate positive lookahead code' do
      nested_code {|g| g.gen_intermediate_assert label }.
        should == '@scanner.skip(/(?=\w+)/)'
    end
  end

  describe '#gen_intermediate_disallow' do
    it 'generates intermediate negative lookahead code' do
      nested_code {|g| g.gen_intermediate_disallow label }.
        should == '@scanner.skip(/(?!\w+)/)'
    end
  end

  describe '#gen_intermediate_skip' do
    it 'generates intermediate skipping code' do
      nested_code {|g| g.gen_intermediate_skip label }.
        should == '@scanner.skip(/\w+/)'
    end
  end

end
