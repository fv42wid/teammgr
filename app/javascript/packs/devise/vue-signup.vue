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
                                          :rules="[comparePasswords]"></v-text-field>
                        </v-flex>
                    </v-layout>
                    <v-layout row>
                        <v-flex xs12>
                            <v-btn type="submit" primary>Sign Up</v-btn>
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
                }
            }
        },
        methods: {
            signUp() {

            }
        },
        computed: {
            comparePasswords() {
                return this.user.password !== this.user.password_confirmation ? 'Passwords do not match' : ''
            }
        },
        created: function() {
            console.log('user signup created')
        }
    }
</script>