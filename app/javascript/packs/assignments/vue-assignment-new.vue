<template>
    <v-layout row>
        <v-flex xs12>
            <form @submit.prevent="submitAssignment()">
                <v-layout row>
                    <v-flex xs12>
                        <v-text-field name="project"
                                      label="Project Name"
                                      id="project"
                                      v-model="assignment.project"
                                      required></v-text-field>
                    </v-flex>
                </v-layout>
                <v-layout row>
                    <v-flex xs6>
                        <v-menu lazy
                                :close-on-content-click="true"
                                v-model="startdateMenu"
                                transition="scale-transition"
                                offset-y
                                full-width
                                :nudge-left="40"
                                max-width="290px">
                            <v-text-field slot="activator"
                                          label="Start Date"
                                          id="start-date"
                                          v-model="assignment.startDate"
                                          prepend-icon="event"
                                          readonly
                                          required></v-text-field>
                            <v-date-picker no-title
                                           scrollable
                                           v-model="assignment.startDate"
                                           actions>
                                <template scope="{save, cancel}">
                                    <v-card-actions>
                                        <v-btn flat primary @click="cancel()">Cancel</v-btn>
                                        <v-btn flat primary @click="save()">Save</v-btn>
                                    </v-card-actions>
                                </template>
                            </v-date-picker>
                        </v-menu>
                    </v-flex>
                    <v-flex xs6>
                        <v-menu lazy
                                :close-on-content-click="true"
                                v-model="enddateMenu"
                                transition="scale-transition"
                                offset-y
                                full-width
                                :nudge-left="40"
                                max-width="290px">
                            <v-text-field slot="activator"
                                          label="End Date"
                                          id="end-date"
                                          v-model="assignment.endDate"
                                          prepend-icon="event"
                                          readonly
                                          required></v-text-field>
                            <v-date-picker no-title
                                           scrollable
                                           v-model="assignment.endDate"
                                           actions>
                                <template scope="{save, cancel}">
                                    <v-card-actions>
                                        <v-btn flat primary @click="cancel()">Cancel</v-btn>
                                        <v-btn flat primary @click="save()">Save</v-btn>
                                    </v-card-actions>
                                </template>
                            </v-date-picker>
                        </v-menu>
                    </v-flex>
                </v-layout>
                <v-layout row>
                    <v-flex xs6>
                        <v-text-field name="allocation"
                                      label="Allocation"
                                      type="number"
                                      suffix="%"></v-text-field>
                    </v-flex>
                    <v-flex xs6>
                        <v-select :items="frequencies"
                                  v-model="assignment.frequency"
                                  label="Select Frequency"
                                  autocomplete></v-select>
                    </v-flex>
                </v-layout>
                <v-layout row>
                    <v-flex xs3 offset-xs9>
                        <v-btn class="primary" type="submit">Create</v-btn>
                    </v-flex>
                </v-layout>
            </form>
        </v-flex>
    </v-layout>
</template>

<script>
    module.exports = {
        data: function() {
            return {
                assignment: {
                    employee_id: null,
                    user_id: null,
                    project: '',
                    allocation: '',
                    frequency: '',
                    startDate: '',
                    endDate: ''
                },
                startdateMenu: true,
                enddateMenu: false,
                frequencies: ['Weekly', 'Monthly']
            }
        },
        methods: {
            submitAssignment() {
                console.log(this.assignment)
            }
        },
        created() {
            console.log('new assignment create')
        }
    }
</script>
