<template>
    <div class="container mt-4 pt-4">
        <div class="row mt-4" v-if="!loggedIn">
            <div class="col-6 offset-3">
                <div class="card">
                    <div class="card-body">
                        <form action="#" @submit.prevent="handleLogin">
                            <h3>Login form</h3>
                            <div class="form-row">
                                <input type="email" name="email" v-model="formData.email" class="form-control"
                                    :class="{ 'is-invalid': authErrors?.errors?.email }" placeholder="Email Address">
                                <div class="invalid-feedback" v-for="msg in authErrors?.errors?.email" v-text="msg"></div>
                            </div>
                            <div class="form-row">
                                <input type="password" name="password" v-model="formData.password"
                                    :class="{ 'is-invalid': authErrors?.errors?.password }" class="form-control"
                                    placeholder="Password">
                                <div class="invalid-feedback" v-for="msg in authErrors?.errors?.password" v-text="msg">
                                </div>
                            </div>
                            <div class="form-row">
                                <button type="submit" class="btn btn-primary">Login</button>
                                <button type="button" class="btn btn-link">Register?</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4" v-if="loggedIn">
            <div class="col-6 offset-3">
                <h3>My Posts</h3>
                <div class="btn-group float-right" role="group" aria-label="Basic outlined example">
                    <button type="button" class="btn btn-outline-primary" v-on:click="language = 'en'">English</button>
                    <button type="button" class="btn btn-outline-primary" v-on:click="language = 'ar'">العربية</button>
                    <button type="button" class="btn btn-outline-primary" v-on:click="language = 'ku'">کوردی</button>
                </div>
                <div class="post" v-for="(post, index) in posts?.data" :key="post.id">
                    <em v-text="post?.created_at"></em><br>
                    <strong v-if="language == 'en'" v-text="post?.title?.en"></strong>
                    <strong v-if="language == 'ar'" v-text="post?.title?.ar"></strong>
                    <strong v-if="language == 'ku'" v-text="post?.title?.ku"></strong>
                </div>
                <Bootstrap5Pagination :data="posts" @pagination-change-page="getPosts" />
            </div>
        </div>

    </div>
</template>

<script>
import { Bootstrap5Pagination } from 'laravel-vue-pagination';
export default {
    components: {
        Bootstrap5Pagination,
    },
    data() {
        return {
            language: 'en',
            loggedIn: false,
            headers: {},
            posts: {},
            authErrors: {},
            formData: {
                email: '',
                password: '',
            }
        }
    },
    methods: {
        handleLogin() {
            axios.get('/sanctum/csrf-cookie').then((response) => {
                axios.post('/api/login', this.formData).then((response) => {
                    this.loggedIn = true
                    const config = {
                        headers: {
                            'Accept': 'application/json',
                            'Authorization': `Bearer ${response.data?.token}`
                        }
                    }
                    this.headers = config
                    this.getPosts()
                }, (errors) => {
                    this.authErrors = errors.response?.data
                    this.loggedIn = false
                })
            })
        },
        getPosts(page = 1) {
            axios.get('/api/posts?page=' + page, this.headers).then((response) => {
                this.posts = response.data
                console.log(this.posts)
            }, () => this.loggedIn = false)
        },
    },
}
</script>

<style>
.form-row {
    margin-bottom: 8px;
}
</style>
