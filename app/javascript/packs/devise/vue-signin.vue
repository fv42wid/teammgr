<template>
    <v-card>
        <v-card-text>
            <v-container>
                <form @submit.prevent="signIn">
                    <v-layout row>
                        <v-flex xs12>
                            <v-text-field name="email"
                                          id="email"
                                          v-model="user.email"
                                          type="email"
                                          placeholder="Email"
                                          :disabled="loading"
                                          required></v-text-field>
                        </v-flex>
                    </v-layout>
                    <v-layout row>
                        <v-flex xs12>
                            <v-text-field name="password"
                                          id="password"
                                          v-model="user.password"
                                          type="password"
                                          :disabled="loading"
                                          placeholder="Password"></v-text-field>
                        </v-flex>
                    </v-layout>
                    <v-layout row>
                        <v-flex xs12>
                            <v-btn type="submit"
                                   :disabled="loading"
                                   :loading="loading"
                                   @click="loader = 'loading'"
                                   primary>
                                Sign In
                                <span slot="loader" class="custom-loader">
                                    <v-icon primary>cached</v-icon>
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
                    remember_me: false
                },
                utf8: '',
                authenticity_token: '',
                loading: false,
                errors: []
            }
        },
        methods: {
            signIn() {
                this.loading = true;
                this.$http.post('/users/sign_in', { utf8: this.utf8, authenticity_token: this.authenticity_token, user: this.user }).then(
                    response => {
                        console.log(response)
                        this.loading = false
                        Turbolinks.visit('/employees')
                    }, response => {
                        console.log(response.body.error)
                        this.loading = false
                    }
                )
            }
        },
        created: function() {
            this.utf8 = document.getElementsByName('utf8')[0].getAttribute('value')
            this.authenticity_token = document.getElementsByName('authenticity_token')[0].getAttribute('value')
            console.log('sign in created')
        }
    }
</script>