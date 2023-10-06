module FormStylingHelper
  def form_label_css
    'block mb-2 text-sm font-medium text-gray-900 dark:text-white'
  end

  def text_field_input_css
    "border border-gray-300 text-gray-900 sm:text-sm
    rounded-lg focus:ring-gray-400 focus:border-primary-600
    block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600
    dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500
    dark:focus:border-blue-500"
  end

  def form_text_area_input_css
    "block p-2.5 w-full text-sm text-gray-900  rounded-lg border
    border-gray-300 focus:ring-gray-500 focus:border-blue-500 dark:bg-gray-700
    dark:border-gray-600 dark:placeholder-gray-400 dark:text-white
    dark:focus:ring-blue-500 dark:focus:border-blue-500"
  end

  def form_select_input_css
    " border border-gray-300 text-gray-900 text-sm
    rounded-lg focus:ring-gray-500 focus:border-blue-500 block w-full
    p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400
    dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
  end

  def form_date_select_input_css
    " border border-gray-300 text-gray-900 text-sm
    rounded-lg focus:ring-gray-500 focus:border-blue-500 inline-block w-28
    p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400
    dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
  end

  def form_check_box_input_css
    "w-4 h-4 border border-gray-300 rounded
    focus:ring-3 focus:ring-gray-300 dark:bg-gray-700
    dark:border-gray-600 dark:focus:ring-primary-600
    dark:ring-offset-gray-800"
  end
end
