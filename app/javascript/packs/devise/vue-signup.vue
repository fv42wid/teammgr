<template>
    <v-card>
        <v-card-text>
            <v-container>
                <form @submit.prevent="signUp">
                    <v-layout row>
                        <v-flex xs12>
                            <v-text-field name="email"
                                          label="Email"
                                          id="email"
                                          v-model="user.email"
                                          type="email"
                                          :disabled="loading"
                                          required></v-text-field>

                        </v-flex>
                    </v-layout>
                    <v-layout row>
                        <v-flex xs12>
                            <v-text-field name="password"
                                          label="Password"
                                          id="password"
                                          v-model="user.password"
                                          type="password"
                                          :disabled="loading"
                                          required></v-text-field>
                        </v-flex>
                    </v-layout>
                    <v-layout row>
                        <v-flex xs12>
                            <v-text-field name="password_confirmation"
                                          label="Confirm Password"
                                          id="password_confirmation"
                                          v-model="user.password_confirmation"
                                          type="password"
                                          :disabled="loading"
                                          :rules="[comparePasswords]"></v-text-field>
                        </v-flex>
                    </v-layout>
                    <v-layout row>
                        <v-flex xs12>
                            <v-btn type="submit"
                                   primary
                                   :disabled="loading"
                                   :loading="loading"
                                   @click.native="loader = 'loading'">
                                Sign Up
                                <span slot="loader" class="custom-loader">
                                    <v-icon light>cached</v-icon>
                                </span>
                            </v-btn>
                        </v-flex>
                    </v-layout>
                </form>
            </v-container>
        </v-card-text>
    </v-card>
</template>

<script>
    module.exports = {
        data: function() {
            return {
                user: {
                    email: '',
                    password: '',
                    password_confirmation: ''
                },
                csrf_token: '',
                utf8: '',
                authenticity_token: '',
                loading: false,
                errors: []
            }
        },
        methods: {
            signUp() {
                this.loading = true
                this.$http.post('/users', { utf8: this.utf8, authenticity_token: this.authenticity_token, user: this.user}).then(
                    response => {
                        //console.log(response)
                        this.loading = false
                        Turbolinks.visit('/employees')
                    }, response => {
                        //console.log(response.body.errors)
                        this.loading = false

                        for(var field in response.body.errors) {
                            //console.log(response.body.errors[field])

                            for(var message in response.body.errors[field]){
                                //console.log(field + ' ' + response.body.errors[field][message])
                                this.errors.push(field + ' ' + response.body.errors[field][message])
                            }
                        }
                        this.$emit('update:errors', this.errors)

                    }
                )
            }
        },
        computed: {
            comparePasswords() {
                return this.user.password !== this.user.password_confirmation ? 'Passwords do not match' : ''
            },
            error() {
                return this.errors
            }
        },
        created: function() {
            this.csrf_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            this.utf8 = document.getElementsByName('utf8')[0].getAttribute('value')
            this.authenticity_token = document.getElementsByName('authenticity_token')[0].getAttribute('value')
            console.log('user signup created')
        }
    }
</script>