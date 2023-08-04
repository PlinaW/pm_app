module FormHelper
  def label_class
    'block mb-2 text-sm font-medium text-gray-900 dark:text-white'
  end

  def text_field_input
    "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm
    rounded-lg focus:ring-primary-600 focus:border-primary-600
    block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600
    dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500
    dark:focus:border-blue-500"
  end

  def text_area_input
    "block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border
    border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700
    dark:border-gray-600 dark:placeholder-gray-400 dark:text-white
    dark:focus:ring-blue-500 dark:focus:border-blue-500"
  end

  def select_input
    "bg-gray-50 border border-gray-300 text-gray-900 text-sm
    rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full
    p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400
    dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
  end

  def date_select_input
    "bg-gray-50 border border-gray-300 text-gray-900 text-sm
    rounded-lg focus:ring-blue-500 focus:border-blue-500 inline-block w-28
    p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400
    dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
  end

  def check_box_input
    "w-4 h-4 border border-gray-300 rounded bg-gray-50
    focus:ring-3 focus:ring-primary-300 dark:bg-gray-700
    dark:border-gray-600 dark:focus:ring-primary-600
    dark:ring-offset-gray-800"
  end

  def form_submit_btn
    "w-full text-white bg-primary-600 hover:bg-primary-700
    focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium
    rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600
    dark:hover:bg-primary-700 dark:focus:ring-primary-800"
  end

  def form_back_btn
    'w-full flex items-center justify-center py-2.5 px-5 text-sm font-medium
     text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200
     hover:bg-gray-300 hover:text-white focus:z-10 focus:ring-4 focus:ring-gray-200
     dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600
     dark:hover:text-white dark:hover:bg-gray-700'
  end

  def form_delete_btn
    "w-full flex items-center justify-center py-2.5 px-5 text-sm font-medium
    text-red-900 focus:outline-none bg-white rounded-lg border border-red-200
    hover:bg-red-600 hover:text-white focus:z-10 focus:ring-4 focus:ring-red-200
    dark:focus:ring-red-700 dark:bg-red-800 dark:text-red-400 dark:border-red-600
    dark:hover:text-white dark:hover:bg-red-700"
  end
end
