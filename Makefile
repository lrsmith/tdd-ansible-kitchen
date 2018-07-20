#
# Ansible
#

ansible_create_dirs:
	mkdir -p roles/test-role

ansible_cleanup:
	rm -rf ./roles

ansible_kitchen_init: ansible_create_dirs
	cd roles/test-role ; kitchen init --driver=docker --provisioner=anisble-playbook
	mkdir roles/test-role/test/integration/default
	mkdir roles/test-role/test/integration/default/serverspec


#
# Kitchen
#
kitchen_test:
	cd roles/test-role ; kitchen test

kitchen_list:
	cd roles/test-role ; kitchen list

kitchen_verify:
	cd roles/test-role ; kitchen verify
	$(MAKE) kitchen_list

#
# RVM Specific Commands. Setup test framework.
#

rvm_gemset_create:
	rvm gemset create tdd-ansible-kitchen

rvm_gemset_install_gems: rvm_gemset_create
	gem install kitchen-ansible
	gem install kitchen-docker kitchen-ansible
	gem install server-spec
	gem install test-kitchen 

rvm_gemset_use:
	rvm gemset use tdd-ansible-kitchen

rvm_gemset_export:  
	rvm gemset export
