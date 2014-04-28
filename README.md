# Berkshelf::Envs

Berkshelf 3.0 envs extension.

## Installation

Add this line to your application's Gemfile:

    gem 'berkshelf-envs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install berkshelf-envs

## Usage

Activate the extension in your `Berksfile`:

    source 'https://api.berkshelf.com'
    extension 'envs'

## Methods
---
### company_repo (repo_hash)

Sets the default company repository. `repo_hash` must contain only one key, value. The key is the repository type like, **:git, :path etc**. The value must be a *single-qouted* string with the `cookbook_name` variable which will be expanded during `company_cookbook` execution.

    company_repo git: 'git@github.com:/myBase/#{cookbook_name}.git'

### company_cookbook (*args)

The `company_cookbook` method works the same way as the berkshelf `cookbook` method, but uses the default company repository specified by `company_repo`.

    company_repo git: 'git@github.com:/myBase/#{cookbook_name}.git'
    
    company_cookbook 'nginx' # args equal to git: 'git@github.com:/myBase/nginx.git'
    
    company_cookbook 'runit', cookbook_name: 'chef-runit' # args equal to git: 'git@github.com:/myBase/chef-runit.git'
    
    company_cookbook 'apache', path: '~/cookbooks/apache' # the default company repository is ignored in case another location is given

### include_berks (filepath)

Allows to split the `Berksfile` configuration into many and include them.

    include_berks '../my-custom-cookbook-list'

## Contributing

1. Fork it ( http://github.com/dennybaa/berkshelf-envs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
