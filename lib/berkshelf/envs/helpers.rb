require 'berkshelf/errors'

module Berkshelf
  module Envs
    module Helpers

      # Set the default company repository
      def company_repo(repo_hash=nil)
        if repo_hash.nil?
          @company_repo ||= {}
        else
          if repo_hash.keys.count > 1
            raise Berkshelf::ArgumentError, "company_repo expects hash with only one key value"
          end
          @company_repo = repo_hash
        end
      end

      # Call berkshelf cookbook method using custom company repository.
      # For *args see berkshelf cookbook method
      def company_cookbook(*args)
        options = args.last.is_a?(Hash) ? args.pop : Hash.new
        name, constraint = args
        id, repo = company_repo.to_a.first
        locations = Berkshelf.constants.map {|c| c.to_s}.select {|c| c.end_with?("Location") }

        # unless the location is explicitly specified use custom company repository
        if options.keys.none? {|k| lid = k.to_s.capitalize; locations.include?("#{lid}Location") }
          cookbook_name = options.delete(:cookbook_name) || name
          location_hash = {id => eval(%Q("#{repo}"))}
        else
          location_hash = {}
        end
        cookbook(name, constraint, options.merge(location_hash))
      end

      # Eval another berksfile in the current context
      def include_berks(filepath)
        raise BerksfileNotFound.new(filepath) unless File.exist?(filepath)
        filepath = filepath.to_s
        contents = File.read(filepath)
        eval(contents, binding, filepath, 1)
      end

    end
  end
end
