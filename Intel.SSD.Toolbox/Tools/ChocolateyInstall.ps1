$packageName = '{{PackageName}}';
# $url = 'http://downloadmirror.intel.com/18455/eng/Intel%20SSD%20Toolbox%20-%20v3.3.0.exe';
$url = '{{DownloadUrl}}'

Install-ChocolateyPackage $package 'exe' '/s' $url;
