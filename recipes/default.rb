# # # # # # # #
# n98-magerun #
# # # # # # # #
directory node['n98-magerun']['dir']
git node['n98-magerun']['dir'] do
	repository node['n98-magerun']['git-url']
	reference node['n98-magerun']['git-reference']
	action :sync
	not_if do
		::File.exists?("#{node['n98-magerun']['install_dir']}/#{node['n98-magerun']['install_file']}")
	end
end
bash 'install_n98-magerun' do
	cwd node['n98-magerun']['dir']
	code <<-EOF
		cp n98-magerun.phar #{node['n98-magerun']['install_dir']}/#{node['n98-magerun']['install_file']}
	EOF
	not_if do
		::File.exists?("#{node['n98-magerun']['install_dir']}/#{node['n98-magerun']['install_file']}")
	end
	creates "#{node['n98-magerun']['install_dir']}/#{node['n98-magerun']['install_file']}"
end