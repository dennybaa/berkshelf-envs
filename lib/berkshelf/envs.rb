require "berkshelf/envs/version"
require "berkshelf/envs/helpers"

module Berkshelf
  module Envs

    # Since we don't access to the evaulauted berksfile,
    # we do hack and locate object in the GC
    ObjectSpace.each_object(Berkshelf::Mixin::DSLEval::CleanRoom) do |obj|
      obj.extend(Berkshelf::Envs::Helpers)
    end

  end
end
