# -*- coding: UTF-8 -*-

require 'app_test_helper'
include UseCases
include Entities
include ApplicationWatch

World(MiniTest::Assertions)
MiniTest::Spec.new(nil)

Before do
  @_new_invitation = Invitation.create_valid!
end

Given /^a sent invitation exists$/ do
  @_sent_invitation = Invitation.create_valid!(:sent_at => Time.now)
end

When /^I cancel an invitation$/ do
  @response = CancelInvitation.new(:id => @_new_invitation.id).exec
  @invitation = @response.invitations.first
end

Then /^the invitation status is cancelled$/ do
  @invitation.cancelled?.must_equal(true)
end

Then /^the cancellation is sent$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^a sent but unconfirmed invitation exists$/ do
  pending
end

When /^I confirm an invitation as attending$/ do
  @response = ConfirmInvitation.new(:id => @_new_invitation.id, :token => @_new_invitation.token, :status => "attending").exec
  @invitation = @response.invitation
end

Then /^the invitation status is attending$/ do
  @invitation.attending?.must_equal(true)
end

When /^I confirm an invitation with the incorrect token value$/ do
  @response = ConfirmInvitation.new(:id => @_new_invitation.id, :token => "invalid_token", :status => "attending").exec
  @invitation = @response.invitation
end

Then /^I receive an invitation error$/ do
  @response.ok?.must_equal(false)
end

And /^the error references an invalid token$/ do
  @response.errors.must_include(:invalid_token)
end

Then /^the invitation status is unconfirmed$/ do
  @invitation.unconfirmed?.must_equal(true)
end

When /^I reconfirm an invitation as not attending$/ do
  @response = ConfirmInvitation.new(:id => @_new_invitation.id, :token => @_new_invitation.token, :status => "not_attending").exec
  @invitation = @response.invitation
end

Then /^the invitation status is not attending$/ do
  @invitation.not_attending?.must_equal(true)
end

When /^I create a new invitation with default values$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the invitation is saved$/ do
  @invitation.persisted?.must_equal(true)
end

Then /^the invitation status is new$/ do
  @invitation.new?.must_equal(true)
end

When /^I create a new invitation with the automatic send option$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the invitation is sent$/ do
  @invitation.sent?.must_equal(true)
end

When /^I send an invitation$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I update the email on an invitation that is new$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I update the email on an invitation that is not new$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the invitation is resent$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I update the token on an invitation that is not new$/ do
  pending # express the regexp above with the code you wish you had
end
