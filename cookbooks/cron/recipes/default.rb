#
# Cookbook Name:: cron
# Recipe:: default
#

if node[:instance_role] == 'app_master'
  cron "import_daily_svb" do
    minute '30'
    hour "8"
    user 'deploy'
    command "cd /data/indinero_rails3_staging/current && \
             RAILS_ENV=production rake crontab:import_daily_svb >> \
             log/cron_jobs/import_daily_svb_transactions.log"
  end
end
