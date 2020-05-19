<?php
  class Products extends Controller {
    public function __construct() {
      $this->productModel = $this->model("Product");
    }

    public function index() {
      $this->search("all");
    }

    public function product($sku = 0) {
      // Get Product
      $product = $this->productModel->getProductBySKU($sku);
      if (!$product) {
        // no product found
        $this->view("pages/pagenotfound");
        đie();
      }

      // Get images
      $imgPath = $product->imgPath;
      $imgPath = explode("/", $imgPath);
      $images = glob("images/" . $imgPath[1] . "/" . $product->sku . "/*");
      $imgQuantity = count($images);

      $data = array (
        "product" => $product,
        "images" => $images,
        "imgQuantity" => $imgQuantity
      );
      $this->view("products/product", $data);
    }

    // Show products by filter
    public function search($categoryCode = "all", $nameFilter = "none", $priceFrom = 0, $priceTo = 9999, $sort = "default", $currentPage = 1) {
      // check variables is not numeric
      if ( !is_numeric($priceFrom) || !is_numeric($priceTo) || !is_numeric($currentPage)) {
        $this->view("pages/pagenotfound");
        die();
      }
      // handle namFilter
      $nameFilter = $this->inputHandler($nameFilter);


      $checkCategory = $this->productModel->getCategoryByCode($categoryCode);
      if (!$checkCategory) {
        // no category found
        $this->view("pages/pagenotfound");
        die();
      }

      // Get all categories
      $categories = $this->productModel->getAllCategories();
      $totalCategories = count($categories);

      $nameFilter = str_replace("_", " ", $nameFilter);

      // Set products per page
      $productsPerPage = 9;

      // Set offset for pagination
      $offset = $productsPerPage * ($currentPage - 1);

      // Get product properties
      $filter = array (
        "categoryCode" => $categoryCode,
        "name" => $nameFilter,
        "priceFrom" => $priceFrom,
        "priceTo" => $priceTo,
        "sort" => $sort,
        "offset" => $offset,
        "limit" => $productsPerPage
      );

      $pagination = $this->pagination($filter);

      // Get total of products and set products per page
      $totalProducts = $this->productModel->getTotalProductsByFilter($filter);
      if ($totalProducts == 0) {
        // no product found
      }

      // Set total of pages
      $totalPages = ceil($totalProducts/$productsPerPage);
      if ($currentPage > $totalPages && $currentPage != 1) {
        // if user input url with current page too large
        $this->view("pages/pagenotfound");
        die();
      }

      // Get products by filter
      $productsToDisplay = $this->productModel->getProductsByFilter($filter);
      if ($productsPerPage > count($productsToDisplay)) {
        $productsPerPage = count($productsToDisplay);
      }

      $data = array(
        "category" => $categories, // object array
        "totalCategories" => $totalCategories,
        "products" => $productsToDisplay, // object array
        "totalProducts" => $totalProducts,
        "totalPages" => $totalPages,
        "productsPerPage" => $productsPerPage,
        "currentPage" => $currentPage,
        "filter" => $filter, // array
        "pagination" => $pagination
      );

      $this->view("products/index", $data);
    }

    private function pagination($filter) {
      $pagination = $filter["categoryCode"] . "/" . $filter["name"] . "/" . $filter["priceFrom"] . "/" . $filter["priceTo"] . "/" . $filter["sort"];
      return $pagination;
    }

    private function inputHandler($str) {
      $str = strtolower($str);
      $str = trim($str);
      $str = preg_replace('/[^a-z0-9 _]/i', '', $str);
      $str = preg_replace('/  +/', ' ', $str);
      $str = preg_replace('/ /i', '_', $str);
      $str = preg_replace('/__+/', '_', $str);

      return $str;
    }
  }
?>
