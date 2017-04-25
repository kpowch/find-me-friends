import PropTypes from 'prop-types';
import React from 'react';

export default class EditProfile extends React.Component {
   constructor(props) {
    super(props);
    // Need to update initial state so that the user interests start off checked
    this.state = {
      userBio: this.props.currentUser.bio,
      userInterests: this.props.userInterests
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

  // NOTE THIS DOESN'T WORK
  checkIfChecked = (event) => {
    this.state.userInterests.forEach((interest) => {
      if (interest.name === 'asdf') {
        return true;
      } else {
        return false;
      }
    })
  }

  render() {
    return (
      <form>
        {this.props.allInterests.map((interest) => {
          return <label> {interest.name} <input name='felting' type="checkbox" checked={this.state.felting} onChange={this.handleInputChange} /> </label>
        })}
        <input name="bio" type="textarea" value={this.state.bio} placeholder='Edit Bio' onChange={this.handleInputChange} />
        <input type="submit" value="Submit" />
      </form>
    );
  }
}
