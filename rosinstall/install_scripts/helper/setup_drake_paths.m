root_dir = getenv('VIGIR_ROOT_DIR');
current_path = pwd;

if ( isempty(root_dir) )
  root_dir = getenv('THOR_ROOT');
end

if ( isempty(root_dir) )
  warning('Neither VIGIR_ROOT_DIR nor THOR_ROOT set: Not setting Drake paths');
  return;
end

drake_base_path = [root_dir '/src/external/drake-distro'];

if ( ~exist(drake_base_path,'dir') )
  warning('There does not seem to be a Drake installation in your ROOT_DIR. Not setting Drake paths');
  return;
end

cd(drake_base_path)
addpath_pods
cd drake
addpath_drake

cd(current_path)

clear root_dir
clear drake_base_path
clear current_path
