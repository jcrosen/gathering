# -*- coding: UTF-8 -*-

module ApplicationWatch
  
  # def db
    # Application.instance.config.backend
  # end

  # Enable rollback for specification tests
  class MiniTest::Spec
    def db
      Application.instance.config.backend
    end
  
    def run( *args, &block )
      value = nil
   
      begin
        db.transaction do
          value = super
          raise RubyPersistenceAPI::Rollback
        end
      rescue RubyPersistenceAPI::Rollback
      end
   
      return value  # The result of run must be always returned for the pretty dots to show up
    end
   
  end
  
  # Enable rollback for more traditional/classic tests (specifically used in lib tests)
  class TestCase < ActiveSupport::TestCase

    def db
      Application.instance.config.backend
    end

    def run_with_transaction_rollback(*args)
      ret_value = nil
      db.transaction do
        # Taken from here https://github.com/seattlerb/minitest/blob/master/lib/minitest/unit.rb#L925
        ret_value = run_without_transaction_rollback(*args)
        raise RubyPersistenceAPI::Rollback
      end

      ret_value # The result of run must be always returned for formatters to work correctly
    end

    alias_method_chain :run, :transaction_rollback

  end

end
