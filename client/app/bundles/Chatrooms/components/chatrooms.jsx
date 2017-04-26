import PropTypes from 'prop-types';
import React from 'react';

export default class Chatrooms extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  constructor(props, _railsContext) {
    super(props);

    this.state = {
      name: this.props.name,
      friendships: this.props.friends
    };

  }

  render() {
    return (
    <div className='sidebarz'>
      <div>
       <h1> I am currently not in use </h1>
      </div>
    </div>
    )
  }
}
