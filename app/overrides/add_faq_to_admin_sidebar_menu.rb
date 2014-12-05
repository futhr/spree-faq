Deface::Override.new(
  virtual_path:  'spree/layouts/admin',
  name:          'faq_admin_sidebar_menu',
  insert_bottom: '.sidebar-menu',
  partial:       'spree/admin/shared/faq_main_menu',
  disabled:      false
)
