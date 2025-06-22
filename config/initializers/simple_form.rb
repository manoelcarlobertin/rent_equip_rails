SimpleForm.setup do |config|
  config.wrappers :default, class: 'mb-4', hint_class: 'text-sm text-gray-500',
    error_class: 'text-red-600', valid_class: 'text-green-600' do |b|
    b.use :html5
    b.use :placeholder

    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly

    b.use :label, class: 'block mb-2 text-sm font-medium text-gray-900 dark:text-white'
    b.use :input, class: 'bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500'
    b.use :hint, wrap_with: { tag: :p, class: 'mt-1 text-sm text-gray-500 dark:text-gray-400' }
    b.use :error, wrap_with: { tag: :p, class: 'mt-2 text-sm text-red-600 dark:text-red-500' }
  end

  config.default_wrapper = :default
  config.boolean_style = :inline
  config.button_class = 'text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800'
  config.error_notification_class = 'p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400'
  config.error_notification_tag = :div
  config.label_class = 'block mb-2 text-sm font-medium text-gray-900 dark:text-white'
  config.default_form_class = 'space-y-6'
  config.boolean_label_class = 'ml-2 text-sm font-medium text-gray-900 dark:text-gray-300'
  config.input_field_error_class = 'bg-red-50 border border-red-500 text-red-900 placeholder-red-700 text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-full p-2.5 dark:bg-red-100 dark:border-red-400'
  config.input_field_valid_class = 'bg-green-50 border border-green-500 text-green-900 placeholder-green-700 text-sm rounded-lg focus:ring-green-500 focus:border-green-500 block w-full p-2.5 dark:bg-green-100 dark:border-green-400'
  config.browser_validations = true
  config.generate_additional_classes_for = [:wrapper, :label, :input]
  config.required_by_default = true
  config.translate_labels = true
  config.inputs_discovery = true
  config.cache_discovery = !Rails.env.development?
end
