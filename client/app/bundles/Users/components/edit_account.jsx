import PropTypes from 'prop-types';
import React from 'react';

export default class EditAccount extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      firstName: this.props.currentUser.first_name,
      lastName: this.props.currentUser.last_name,
      email: this.props.currentUser.email,
      // NOTE: This is empty right now and causes an error on startup
      bio: this.props.currentUser.bio
    };
  }

  handleInputChange = (event) => {
    const target = event.target;
    const value = target.type === 'checkbox' ? target.checked : target.value;
    const name = target.name;

    this.setState({
      [name]: value
    });
  }

  handleSubmit = () => {
    alert(`Here are your new values: \n first name: ${this.state.firstName} \n last name: ${this.state.lastName} \n email: ${this.state.email} \n password: ${this.state.password} \n bio: ${this.state.bio}`)
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <input name="firstName" type="text" value={this.state.firstName} placeholder='Edit First Name' onChange={this.handleInputChange} />
        <input name="lastName" type="text" value={this.state.lastName} placeholder='Edit Last Name' onChange={this.handleInputChange} />
        <input name="email" type="email" value={this.state.email} placeholder='Edit Email' onChange={this.handleInputChange} />
        <input name="password" type="password" placeholder='Edit Password' onChange={this.handleInputChange} />
        <input name="bio" type="textarea" value={this.state.bio} placeholder='Edit Bio' onChange={this.handleInputChange} />
        <input type="submit" value="Submit" />
      </form>
    );
  }
}
