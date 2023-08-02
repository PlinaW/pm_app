module ButtonHelper
  def dropdown_btn_class
    'w-full md:w-auto flex items-center justify-center py-2 px-4 text-sm font-medium
     text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200
     hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200
     dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600
     dark:hover:text-white dark:hover:bg-gray-700'
  end

  def btn_primary
    'flex items-center justify-center text-white bg-primary-700 hover:bg-primary-800
    focus:ring-4 focus:ring-primary-300 font-medium rounded-lg text-sm px-4 py-2
    dark:bg-primary-600 dark:hover:bg-primary-700 focus:outline-none dark:focus:ring-primary-800'
  end
end
