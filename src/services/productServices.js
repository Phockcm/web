import axiosClient from "@/libs/axiosClient";

export async function getAllProducts() {
    const res = await axiosClient.get("/products");
    return res.data;
}

export async function getAdminProducts() {
    const res = await axiosClient.get("/productsByPageSize?pagination[pageSize]=100000");
    return res.data.data || res.data;
}

export async function getProducts({ page = 1, pageSize = 8, categoryId, search, sortBy } = {}) {
    const params = new URLSearchParams();
    params.append("pagination[page]", page);
    params.append("pagination[pageSize]", pageSize);
    if (categoryId) {
        params.append("filters[cat_id][$eq]", categoryId);
    }
    if (search) {
        params.append("filters[product_name][$contains]", search);
    }
    if (sortBy) {
        if (sortBy === "price_asc") {
            params.append("sort", "price:asc");
        } else if (sortBy === "price_desc") {
            params.append("sort", "price:desc");
        } else if (sortBy === "newest") {
            params.append("sort", "created_at:desc");
        }
    }
    const res = await axiosClient.get(`/activeProductsByPageSize?${params.toString()}`);
    return {
        products: res.data.data || [],
        currentPage: res.data.pagination?.page || 1,
        totalPage: res.data.pagination?.pageCount || 1,
        total: res.data.pagination?.total || 0
    };
}

export async function getProductBySlug(slug) {
    const res = await axiosClient.get(`/showDetails/${slug}`);
    // The API response structure is { data: product }
    return res.data.data || res.data;
}

export async function getProductById(id) {
    const res = await axiosClient.get(`/products/${id}`);
    return res.data.data || res.data;
}

export async function createProduct(productData) {
    const res = await axiosClient.post("/products", productData, {
        headers: {
            "Content-Type": "multipart/form-data",
        },
    });
    return res.data;
}

export async function updateProduct(id, productData) {
    // Laravel requires _method: 'PUT' in a multipart/form-data request
    const data = productData instanceof FormData ? productData : new FormData();
    if (!(productData instanceof FormData)) {
        for (const key in productData) {
            data.append(key, productData[key]);
        }
    }
    if (!data.has("_method")) {
        data.append("_method", "PUT");
    }
    
    const res = await axiosClient.post(`/products/${id}`, data, {
        headers: {
            "Content-Type": "multipart/form-data",
        },
    });
    return res.data;
}

export async function deleteProduct(id) {
    const res = await axiosClient.delete(`/products/${id}`);
    return res.data;
}

export async function getNewProducts(limit = 4) {
    const res = await axiosClient.get(`/newProducts/${limit}`);
    return res.data;
}

export async function getSaleProducts(limit = 4) {
    const res = await axiosClient.get(`/saleProducts/${limit}`);
    return res.data;
}

export async function getHotProducts(limit = 4) {
    const res = await axiosClient.get(`/hotProducts/${limit}`);
    return res.data;
}