# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new # guest user (not logged in)

  #  user.role.name = "Gerente"
    if user.role.name == "admin"
      can :manage, :all
      can :manage, :dashboard
    elsif user.role.name == "customer"
        cannot :manage, :all
        can :read, ServiceOrder, :user_id
        can :show_from_modal, ServiceOrder
        can :show_from_pdf, ServiceOrder
        can :filter_form, ServiceOrder
        can :show_from_pdf, Diagnosis
        can :note_from_pdf, Diagnosis
        can :output_pdf, Diagnosis
    elsif user.role.name == "sale_product"
        can :manage, :all
        can :manage, :dashboard
        cannot :manage, Purchase
        cannot :manage, Expense
        cannot :manage, QuotationService
        cannot :manage, User
        cannot :manage, Provider
        cannot :manage, ServiceOrder
        cannot :service_orders_total, :Report
        cannot :in_total, :Report
    elsif user.role.name == "sale_service"
        can :manage, :all
        can :manage, :dashboard
        cannot :manage, Purchase
        cannot :manage, Expense
        cannot :manage, Quotation
        cannot :manage, User
        cannot :manage, Provider
        cannot :manage, ServiceOrder
        cannot :service_orders_total, :Report
        cannot :in_total, :Report
        cannot :stocks_total, :Report
        cannot :kardex, :Report
        cannot :products_total, :Report
    elsif user.role.name == "purchase"
        can :manage, :all
        can :manage, :dashboard
        cannot :manage, Sale
        cannot :manage, Expense
        cannot :manage, ServiceOrder
        cannot :manage, User
        cannot :manage, ServiceOrder
        cannot :sales_total, :Report
        cannot :orders_total, :Report
        cannot :service_orders_total, :Report
        cannot :quotations_total, :Report
    elsif user.role.name == "service"
        can :manage, :all
        can :manage, :dashboard
        cannot :manage, Sale
        cannot :manage, Purchase
        cannot :manage, Expense
    end

  end
end
