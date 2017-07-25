# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    #primary.item :items, 'Parts', items_path

    primary.item :items, 'Parts', items_path do |sub_nav|
      sub_nav.item :items, 'Motherboard', items_path
    end
  end
end
