class ScrapperConstants {
  // Website List
  static const WEBSITE_LIST = {
    'startech': 'Star Tech',
    'ryans': 'Ryans Computers',
    'techland': 'Techland BD'
  };

  // Category List
  static const CATEGORY_LIST = {
    'startech': ScrapperConstants.STARTECH_CATEGORY_LIST,
    'ryans': ScrapperConstants.RYANS_CATEGORY_LIST,
    'techland': ScrapperConstants.TECHLAND_CATEGORY_LIST,
  };

  // Categories
  static const CATEGORIES = [
    'casing',
    'casing_cooler',
    'power_supply',
    'cpu',
    'cpu_cooler',
    'motherboard',
    'graphics_card',
    'hdd',
    'ssd',
    'ram',
    'keyboard',
    'mouse',
    'headphone',
    'speaker',
    'ups',
    'monitor',
  ];

  // Startech
  static const WEBSITE_STARTECH = 'startech';
  static const STARTECH_BASE_URL = 'https://www.startech.com.bd';
  static const STARTECH_PRODUCT_INDEX_URL = '/[1]?limit=10&page=[2]';
  static const STARTECH_CATEGORY_LIST = {
    'casing': 'component/casing',
    'casing_cooler': 'component/casing-cooler',
    'power_supply': 'component/power-supply',
    'cpu': 'component/processor',
    'cpu_cooler': 'component/CPU-Cooler',
    'motherboard': 'component/motherboard',
    'graphics_card': 'component/graphics-card',
    'hdd': 'component/hard-disk-drive',
    'ssd': 'component/SSD-Hard-Disk',
    'ram': 'component/ram',
    'keyboard': 'accessories/keyboards',
    'mouse': 'accessories/mouse',
    'headphone': 'accessories/headphone',
    'speaker': 'accessories/speaker-and-home-theater',
    'ups': 'ups-ips',
    'monitor': 'monitor',
  };

  // Ryans
  static const WEBSITE_RYANS = 'ryans';
  static const RYANS_BASE_URL = 'https://www.ryanscomputers.com';
  static const RYANS_PRODUCT_INDEX_URL = '/category/[1]?limit=10&page=[2]';
  static const RYANS_CATEGORY_LIST = {
    'casing': 'desktop-component-casing',
    'casing_cooler': 'desktop-component-casing-fan',
    'power_supply': 'desktop-component-power-supply',
    'cpu': 'desktop-component-processor',
    'cpu_cooler': 'desktop-component-cpu-cooler',
    'motherboard': 'desktop-component-mainboard',
    'graphics_card': 'desktop-component-graphics-card',
    'hdd': 'internal-hdd',
    'ssd': 'internal-ssd',
    'ram': 'desktop-component-desktop-ram',
    'keyboard': 'desktop-component-keyboard',
    'mouse': 'desktop-component-mouse',
    'headphone': 'sound-system-headphone',
    'speaker': 'sound-system-speaker',
    'ups': 'desktop-component-ups',
    'monitor': 'monitor-all-monitor',
  };

  // Techland
  static const WEBSITE_TECHLAND = 'techland';
  static const TECHLAND_BASE_URL = 'https://www.techlandbd.com';
  static const TECHLAND_PRODUCT_INDEX_URL = '/[1]?limit=10&page=[2]';
  static const TECHLAND_CATEGORY_LIST = {
    'casing': 'pc-components/computer-casing',
    'casing_cooler': 'pc-components/casing-fan',
    'power_supply': 'pc-components/desktop-power-supply',
    'cpu': 'pc-components/shop-processors',
    'cpu_cooler': 'pc-components/cpu-cooling-fan',
    'motherboard': 'pc-components/desktop-motherboard',
    'graphics_card': 'pc-components/shop-graphics-card',
    'hdd': 'pc-components/internal-desktop-hard-disk',
    'ssd': 'pc-components/ssd-drives',
    'ram': 'pc-components/shop-desktop-ram',
    'keyboard': 'accessories/computer-keyboard',
    'mouse': 'accessories/shop-computer-mouse',
    'headphone': 'headphone-speaker/shop-headphones-headsets',
    'speaker': 'tv-home-entertainment/multimedia-speakers',
    'ups': 'ups/offline-ups',
    'monitor': 'computer-monitor',
  };
}
