import PropTypes from 'prop-types';
import React from 'react';

export default class Welcome extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };

  /**
   * @param props - Comes from your rails view.
   * @param _railsContext - Comes from React on Rails
   */
  constructor(props, _railsContext) {
    super(props);

    // this.state = { name: this.props.name }; FROM HELLO WORLD EXAMPLE
  }

  render() {
    return ()
  }
}
