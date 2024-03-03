module ButtonStylingHelper
  # form buttons
  def form_submit_btn_css
    "w-full text-white bg-primary-700 border border-gray-300 hover:bg-primary-800
    hover:text-white focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium
    rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600
    dark:hover:bg-primary-700 dark:focus:ring-primary-800"
  end

  def form_back_btn_css
    'w-full flex items-center justify-center py-2.5 px-5 text-sm font-medium
     text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-300
     hover:bg-gray-500 hover:text-white focus:z-10 focus:ring-4 focus:ring-gray-200
     dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600
     dark:hover:text-white dark:hover:bg-gray-700'
  end

  def form_delete_btn_css
    "w-full flex items-center justify-center py-2.5 px-5 text-sm font-medium
    text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-300
    hover:bg-red-500 hover:text-white focus:z-10 focus:ring-4 focus:ring-red-200
    dark:focus:ring-red-700 dark:bg-red-800 dark:text-red-400 dark:border-red-600
    dark:hover:text-white dark:hover:bg-red-700"
  end

  # navbar buttons
  def navbar_main_btn_css
    "w-auto px-3 py-2 text-sm font-medium text-center inline-flex items-center
    rounded-lg hover:bg-gray-100 focus:ring-2 focus:outline-none focus:ring-gray-300
    dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
  end

  def navbar_user_dropdown_btn_css
    "block py-2 px-4 text-sm hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-400
    dark:hover:text-white"
  end

  # sidebar buttons
  def sidebar_title_btn_css
    "flex justify-center p-2 w-full text-base font-medium text-gray-900 rounded-lg
    hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"
  end

  def sidebar_main_btn_css
    "flex items-center p-2 pl-3 w-full text-base font-medium text-gray-900 rounded-lg
    hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"
  end

  def sidebar_second_btn_css
    "flex items-center p-2 pl-11 w-full text-sm font-medium text-gray-900 rounded-lg
    hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"
  end

  # main buttons
  def create_btn_css
    "px-5 py-2 text-sm font-medium text-white inline-flex items-center bg-gray-600
    hover:bg-gray-800 focus:ring-4 focus:outline-none focus:ring-gray-300 rounded-lg
    text-center dark:bg-gray-600 dark:hover:bg-gray-700 dark:focus:ring-gray-800"
  end

  def dropdown_btn_class
    'w-full md:w-auto flex items-center justify-center py-2 px-4 text-sm font-medium
    text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200
    hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200
    dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600
    dark:hover:text-white dark:hover:bg-gray-700'
  end

  def complete_btn_css
    'flex py-2 px-4 text-sm font-medium text-gray-900 focus:outline-none bg-white
    rounded-lg border border-gray-200 hover:bg-green-200 hover:text-green-700 focus:z-10
    focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800
    dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700'
  end

  def edit_btn_css
    'flex py-2 px-4 text-sm font-medium text-gray-900 focus:outline-none bg-white
    rounded-lg border border-gray-200 hover:bg-primary-200 hover:text-primary-700 focus:z-10
    focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800
    dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700'
  end

  def delete_btn_css
    'flex py-2 px-4 text-sm font-medium text-gray-900 focus:outline-none bg-white
    rounded-lg border border-gray-200 hover:bg-red-200 hover:text-red-700 focus:z-10
    focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800
    dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700'
  end
end
