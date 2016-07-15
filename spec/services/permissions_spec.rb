require_relative '../../app/services/permissions'

module Permissions
  describe 'Permissions:' do
    describe 'can_manage_organizations' do
      it 'if user is an ally' do
        ally = double 'Ally', id: 'ally-id', type: "Ally", system_admin: false
        expect(permissions_for_user(ally).can_manage_organizations?).to be
      end

      it 'if user is a system admin' do
        admin = double 'Admin', id: 'admin-id', type: nil, system_admin: true
        expect(permissions_for_user(admin).can_manage_organizations?).to be
      end

      it 'unless user is an organization' do
        org = double 'Organization', id: 'org-id', type: "Organization", system_admin: false
        expect(permissions_for_user(org).can_manage_organizations?).not_to be
      end
    end

    describe 'can_manage_allies' do
      it 'if user is a system admin' do
        admin = double 'Admin', id: 'admin-id', type: nil, system_admin: true
        expect(permissions_for_user(admin).can_manage_allies?).to be
      end

      it 'unless user is not a system_admin' do
        other = double 'NotSystemAdmin', id: 'not-system-admin-id', type: "Other", system_admin: false
        expect(permissions_for_user(other).can_manage_allies?).not_to be
      end
    end

    describe 'can_manage_projects' do
      it 'every user' do
        user = double 'User', id: 'user-id', type: nil, system_admin: false
        expect(permissions_for_user(user).can_manage_projects?).to be
      end
    end

    def permissions_for_user(user)
      Permissions.for_user(user)
    end
  end
end
